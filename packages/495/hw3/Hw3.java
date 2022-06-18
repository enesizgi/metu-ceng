import java.io.IOException;
import java.io.StringReader;
import java.util.StringTokenizer;
import java.util.Arrays;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Partitioner;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class Hw3 {

    public static class TokenizerMapper
            extends Mapper<Object, Text, Text, IntWritable> {

        private Text word = new Text();

        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
            String[] values = value.toString().split("\t");
            IntWritable duration = new IntWritable(Integer.parseInt(values[2]));
            context.write(new Text("total"), duration);
        }
    }

    public static class IntSumReducer
            extends Reducer<Text, IntWritable, Text, IntWritable> {
        private IntWritable result = new IntWritable();

        public void reduce(Text key, Iterable<IntWritable> values,
                Context context) throws IOException, InterruptedException {
            int sum = 0;
            for (IntWritable val : values) {
                sum += val.get();
            }
            result.set(sum);
            context.write(key, result);
        }
    }

    public static class TokenizerMapper2
            extends Mapper<Object, Text, Text, FloatWritable> {

        private Text word = new Text();

        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
            String[] values = value.toString().split("\t");
            FloatWritable duration = new FloatWritable(Integer.parseInt(values[2]));
            context.write(new Text("average"), duration);
        }
    }

    public static class IntSumReducer2
            extends Reducer<Text, FloatWritable, Text, FloatWritable> {
        private FloatWritable result = new FloatWritable();

        public void reduce(Text key, Iterable<FloatWritable> values,
                Context context) throws IOException, InterruptedException {
            int sum = 0;
            float count = 0;
            for (FloatWritable val : values) {
                sum += val.get();
                count++;
            }
            result.set(sum / count);
            context.write(key, result);
        }
    }

    public static class TokenizerMapper3
            extends Mapper<Object, Text, Text, IntWritable> {

        private Text word = new Text();

        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
            String[] values = value.toString().split("\t");
            IntWritable duration = new IntWritable(Integer.parseInt(values[2]));
            context.write(new Text(values[0]), duration);
        }
    }

    public static class IntSumReducer3
            extends Reducer<Text, IntWritable, Text, IntWritable> {
        private IntWritable result = new IntWritable();

        public void reduce(Text key, Iterable<IntWritable> values,
                Context context) throws IOException, InterruptedException {
            int sum = 0;
            for (IntWritable val : values) {
                sum++;
            }
            result.set(sum);
            context.write(key, result);
        }
    }

    public static class TokenizerMapper4
            extends Mapper<Object, Text, Text, FloatWritable> {

        private Text word = new Text();

        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
            String[] values = value.toString().split("\t");
            FloatWritable duration = new FloatWritable(Integer.parseInt(values[5]));
            if (values[3].equals("True")) {
                context.write(new Text("explicit"), duration);
            } else {
                context.write(new Text("non-explicit"), duration);
            }
        }
    }

    public static class IntSumReducer4
            extends Reducer<Text, FloatWritable, Text, FloatWritable> {
        private FloatWritable result = new FloatWritable();

        public void reduce(Text key, Iterable<FloatWritable> values,
                Context context) throws IOException, InterruptedException {
            float sum = 0;
            int count = 0;
            for (FloatWritable val : values) {
                sum += val.get();
                count++;
            }
            result.set(sum / count);
            context.write(key, result);
        }
    }

    public static class CaderPartitioner extends
            Partitioner<Text, FloatWritable> {
        @Override
        public int getPartition(Text key, FloatWritable value, int numReduceTasks) {

            if (numReduceTasks == 0) {
                return 0;
            }

            if (key.toString().equals("explicit")) {
                return 0;
            }
            if (key.toString().equals("non-explicit")) {
                return 1;
            }
            return 0;
        }
    }

    public static class TokenizerMapper5
            extends Mapper<Object, Text, Text, FloatWritable> {

        private Text word = new Text();

        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
            String[] values = value.toString().split("\t");
            FloatWritable duration = new FloatWritable(Float.parseFloat(values[6]));
            context.write(new Text(values[4]), duration);
        }
    }

    public static class IntSumReducer5
            extends Reducer<Text, FloatWritable, Text, FloatWritable> {
        private FloatWritable result = new FloatWritable();

        public void reduce(Text key, Iterable<FloatWritable> values,
                Context context) throws IOException, InterruptedException {
            float sum = 0;
            int count = 0;
            for (FloatWritable val : values) {
                sum += val.get();
                count++;
            }
            result.set(sum / count);
            context.write(key, result);
        }
    }

    public static class CaderPartitioner2 extends
            Partitioner<Text, FloatWritable> {
        @Override
        public int getPartition(Text key, FloatWritable value, int numReduceTasks) {

            if (numReduceTasks == 0) {
                return 0;
            }

            int year = Integer.parseInt(key.toString());

            if (year <= 2002) {
                return 0;
            }
            else if ((year > 2002) && (year <= 2012)) {
                return 1;
            }
            else {
                return 2;
            }
        }
    }


    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "word count");
        job.setJarByClass(Hw3.class);
        if (args[0].equals("total")) {
            job.setMapperClass(TokenizerMapper.class);
            job.setReducerClass(IntSumReducer.class);
            job.setOutputKeyClass(Text.class);
            job.setOutputValueClass(IntWritable.class);
        }
        else if (args[0].equals("average")) {
            job.setMapperClass(TokenizerMapper2.class);
            job.setReducerClass(IntSumReducer2.class);
            job.setOutputKeyClass(Text.class);
            job.setOutputValueClass(FloatWritable.class);
        }
        else if (args[0].equals("popular")) {
            job.setMapperClass(TokenizerMapper3.class);
            job.setReducerClass(IntSumReducer3.class);
            job.setOutputKeyClass(Text.class);
            job.setOutputValueClass(IntWritable.class);
        }
        else if (args[0].equals("explicitlypopular")) {
            job.setPartitionerClass(CaderPartitioner.class);
            job.setReducerClass(IntSumReducer4.class);
            job.setNumReduceTasks(2);
            job.setMapperClass(TokenizerMapper4.class);
            job.setOutputKeyClass(Text.class);
            job.setOutputValueClass(FloatWritable.class);
        }
        else if (args[0].equals("dancebyyear")) {
            job.setPartitionerClass(CaderPartitioner2.class);
            job.setReducerClass(IntSumReducer5.class);
            job.setNumReduceTasks(3);
            job.setMapperClass(TokenizerMapper5.class);
            job.setOutputKeyClass(Text.class);
            job.setOutputValueClass(FloatWritable.class);
        }
        FileInputFormat.addInputPath(job, new Path(args[1]));
        FileOutputFormat.setOutputPath(job, new Path(args[2]));
        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}