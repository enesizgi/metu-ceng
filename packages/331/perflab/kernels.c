/********************************************************
 * Kernels to be optimized for the Metu Ceng Performance Lab
 ********************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "defs.h"

/*
 * Please fill in the following team struct
 */
team_t team = {
    "TeamOptimus", /* Team name */

    "Ahmet Buğrahan Budak", /* First member full name */
    "e2380236",             /* First member id */

    "Emre Berk Kaya", /* Second member full name (leave blank if none) */
    "e2380590",       /* Second member id (leave blank if none) */

    "Muhammed Enes izgi", /* Third member full name (leave blank if none) */
    "e2310142"            /* Third member id (leave blank if none) */
};

/****************
 * EXPOSURE FUSION KERNEL *
 ****************/

/*******************************************************
 * Your different versions of the exposure fusion kernel go here
 *******************************************************/

/*
 * naive_fusion - The naive baseline version of exposure fusion
 */
char naive_fusion_descr[] = "naive_fusion: Naive baseline exposure fusion";
void naive_fusion(int dim, int *img, int *w, int *dst)
{

    int i, j, k;
    for (k = 0; k < 4; k++)
    {
        for (i = 0; i < dim; i++)
        {
            for (j = 0; j < dim; j++)
            {
                dst[i * dim + j] += w[k * dim * dim + i * dim + j] * img[k * dim * dim + i * dim + j];
            }
        }
    }
}

/*
 * fusion - Your current working version of fusion
 * IMPORTANT: This is the version you will be graded on
 */
char fusion_descr[] = "fusion: Current working version";
void fusion(int dim, int *img, int *w, int *dst)
{
    int i, j, x;
    int dimxdim = dim * dim;
    int dimxdim2 = dimxdim + dimxdim;
    int dimxdim3 = dimxdim2 + dimxdim;
    int *w_temp = w;
    int *img_temp = img;
    int *w_temp2 = w + dimxdim;
    int *img_temp2 = img + dimxdim;
    int *dst_temp = dst;

    for (i = 0; i < dim; i += 32)
    {
        int x_edge = i + 32;
        for (j = 0; j < dim; j += 32)
        {
            for (x = i; x < x_edge; x++)
            {

                dst_temp[0] += w_temp[0] * img_temp[0] + w_temp2[0] * img_temp2[0];
                dst_temp[1] += w_temp[1] * img_temp[1] + w_temp2[1] * img_temp2[1];
                dst_temp[2] += w_temp[2] * img_temp[2] + w_temp2[2] * img_temp2[2];
                dst_temp[3] += w_temp[3] * img_temp[3] + w_temp2[3] * img_temp2[3];
                dst_temp[4] += w_temp[4] * img_temp[4] + w_temp2[4] * img_temp2[4];
                dst_temp[5] += w_temp[5] * img_temp[5] + w_temp2[5] * img_temp2[5];
                dst_temp[6] += w_temp[6] * img_temp[6] + w_temp2[6] * img_temp2[6];
                dst_temp[7] += w_temp[7] * img_temp[7] + w_temp2[7] * img_temp2[7];
                dst_temp[8] += w_temp[8] * img_temp[8] + w_temp2[8] * img_temp2[8];
                dst_temp[9] += w_temp[9] * img_temp[9] + w_temp2[9] * img_temp2[9];
                dst_temp[10] += w_temp[10] * img_temp[10] + w_temp2[10] * img_temp2[10];
                dst_temp[11] += w_temp[11] * img_temp[11] + w_temp2[11] * img_temp2[11];
                dst_temp[12] += w_temp[12] * img_temp[12] + w_temp2[12] * img_temp2[12];
                dst_temp[13] += w_temp[13] * img_temp[13] + w_temp2[13] * img_temp2[13];
                dst_temp[14] += w_temp[14] * img_temp[14] + w_temp2[14] * img_temp2[14];
                dst_temp[15] += w_temp[15] * img_temp[15] + w_temp2[15] * img_temp2[15];
                dst_temp[16] += w_temp[16] * img_temp[16] + w_temp2[16] * img_temp2[16];
                dst_temp[17] += w_temp[17] * img_temp[17] + w_temp2[17] * img_temp2[17];
                dst_temp[18] += w_temp[18] * img_temp[18] + w_temp2[18] * img_temp2[18];
                dst_temp[19] += w_temp[19] * img_temp[19] + w_temp2[19] * img_temp2[19];
                dst_temp[20] += w_temp[20] * img_temp[20] + w_temp2[20] * img_temp2[20];
                dst_temp[21] += w_temp[21] * img_temp[21] + w_temp2[21] * img_temp2[21];
                dst_temp[22] += w_temp[22] * img_temp[22] + w_temp2[22] * img_temp2[22];
                dst_temp[23] += w_temp[23] * img_temp[23] + w_temp2[23] * img_temp2[23];
                dst_temp[24] += w_temp[24] * img_temp[24] + w_temp2[24] * img_temp2[24];
                dst_temp[25] += w_temp[25] * img_temp[25] + w_temp2[25] * img_temp2[25];
                dst_temp[26] += w_temp[26] * img_temp[26] + w_temp2[26] * img_temp2[26];
                dst_temp[27] += w_temp[27] * img_temp[27] + w_temp2[27] * img_temp2[27];
                dst_temp[28] += w_temp[28] * img_temp[28] + w_temp2[28] * img_temp2[28];
                dst_temp[29] += w_temp[29] * img_temp[29] + w_temp2[29] * img_temp2[29];
                dst_temp[30] += w_temp[30] * img_temp[30] + w_temp2[30] * img_temp2[30];
                dst_temp[31] += w_temp[31] * img_temp[31] + w_temp2[31] * img_temp2[31];
                w_temp += 32;
                img_temp += 32;
                w_temp2 += 32;
                img_temp2 += 32;
                dst_temp += 32;
            }
        }
    }

    w_temp = w + dimxdim2;
    img_temp = img + dimxdim2;
    w_temp2 = w + dimxdim3;
    img_temp2 = img + dimxdim3;
    for (i = 0; i < dim; i += 32)
    {
        for (j = 0; j < dim; j += 32)
        {
            int x_edge = i + 32;
            for (x = i; x < x_edge; x++)
            {

                dst[0] += w_temp[0] * img_temp[0] + w_temp2[0] * img_temp2[0];
                dst[1] += w_temp[1] * img_temp[1] + w_temp2[1] * img_temp2[1];
                dst[2] += w_temp[2] * img_temp[2] + w_temp2[2] * img_temp2[2];
                dst[3] += w_temp[3] * img_temp[3] + w_temp2[3] * img_temp2[3];
                dst[4] += w_temp[4] * img_temp[4] + w_temp2[4] * img_temp2[4];
                dst[5] += w_temp[5] * img_temp[5] + w_temp2[5] * img_temp2[5];
                dst[6] += w_temp[6] * img_temp[6] + w_temp2[6] * img_temp2[6];
                dst[7] += w_temp[7] * img_temp[7] + w_temp2[7] * img_temp2[7];
                dst[8] += w_temp[8] * img_temp[8] + w_temp2[8] * img_temp2[8];
                dst[9] += w_temp[9] * img_temp[9] + w_temp2[9] * img_temp2[9];
                dst[10] += w_temp[10] * img_temp[10] + w_temp2[10] * img_temp2[10];
                dst[11] += w_temp[11] * img_temp[11] + w_temp2[11] * img_temp2[11];
                dst[12] += w_temp[12] * img_temp[12] + w_temp2[12] * img_temp2[12];
                dst[13] += w_temp[13] * img_temp[13] + w_temp2[13] * img_temp2[13];
                dst[14] += w_temp[14] * img_temp[14] + w_temp2[14] * img_temp2[14];
                dst[15] += w_temp[15] * img_temp[15] + w_temp2[15] * img_temp2[15];
                dst[16] += w_temp[16] * img_temp[16] + w_temp2[16] * img_temp2[16];
                dst[17] += w_temp[17] * img_temp[17] + w_temp2[17] * img_temp2[17];
                dst[18] += w_temp[18] * img_temp[18] + w_temp2[18] * img_temp2[18];
                dst[19] += w_temp[19] * img_temp[19] + w_temp2[19] * img_temp2[19];
                dst[20] += w_temp[20] * img_temp[20] + w_temp2[20] * img_temp2[20];
                dst[21] += w_temp[21] * img_temp[21] + w_temp2[21] * img_temp2[21];
                dst[22] += w_temp[22] * img_temp[22] + w_temp2[22] * img_temp2[22];
                dst[23] += w_temp[23] * img_temp[23] + w_temp2[23] * img_temp2[23];
                dst[24] += w_temp[24] * img_temp[24] + w_temp2[24] * img_temp2[24];
                dst[25] += w_temp[25] * img_temp[25] + w_temp2[25] * img_temp2[25];
                dst[26] += w_temp[26] * img_temp[26] + w_temp2[26] * img_temp2[26];
                dst[27] += w_temp[27] * img_temp[27] + w_temp2[27] * img_temp2[27];
                dst[28] += w_temp[28] * img_temp[28] + w_temp2[28] * img_temp2[28];
                dst[29] += w_temp[29] * img_temp[29] + w_temp2[29] * img_temp2[29];
                dst[30] += w_temp[30] * img_temp[30] + w_temp2[30] * img_temp2[30];
                dst[31] += w_temp[31] * img_temp[31] + w_temp2[31] * img_temp2[31];
                w_temp += 32;
                img_temp += 32;
                w_temp2 += 32;
                img_temp2 += 32;
                dst += 32;
            }
        }
    }
}

char fusion_descr_enes[] = "fusion: ENES version";
void fusion_enes(int dim, int *img, int *w, int *dst)
{
    int i, j;
    int dimxdim = dim * dim;
    int dimxdim2 = dimxdim + dimxdim;
    int dimxdim3 = dimxdim2 + dimxdim;
    int t_dim = 0;
    for (i = 0; i < dim; i++)
    {
        for (j = 0; j < dim; j++)
        {
            int tdimj = t_dim + j;
            dst[tdimj] += w[tdimj] * img[tdimj] + w[dimxdim + tdimj] * img[dimxdim + tdimj];
        }
        t_dim += dim;
    }

    t_dim = 0;
    for (i = 0; i < dim; i++)
    {
        for (j = 0; j < dim; j++)
        {
            int tdimj = t_dim + j;
            dst[tdimj] += w[dimxdim2 + tdimj] * img[dimxdim2 + tdimj] + w[dimxdim3 + tdimj] * img[dimxdim3 + tdimj];
        }
        t_dim += dim;
    }
}

char fusion_descr_enes_2[] = "fusion: ENES2 version";
void fusion_enes_2(int dim, int *img, int *w, int *dst)
{
    int i, j;
    int dimxdim = dim * dim;
    int dimxdim2 = dimxdim + dimxdim;
    int dimxdim3 = dimxdim2 + dimxdim;
    int t_dim = 0;
    for (i = 0; i < dim; i++)
    {
        // int tdimj = t_dim;
        // int tdimj2 = t_dim;
        int tdimjplusdimxdim = t_dim + dimxdim;
        for (j = 0; j < dim; j++)
        {
            int temp1 = w[t_dim] * img[t_dim];
            int temp2 = w[tdimjplusdimxdim] * img[tdimjplusdimxdim];
            dst[t_dim] += temp1 + temp2;
            t_dim++;
            tdimjplusdimxdim++;
        }
        // t_dim += dim;
    }

    t_dim = 0;
    for (i = 0; i < dim; i++)
    {
        for (j = 0; j < dim; j++)
        {
            int tdimj = t_dim + j;
            int tdimjplusdimxdim2 = tdimj + dimxdim2;
            int tdimjplusdimxdim3 = tdimj + dimxdim3;
            int temp1 = w[tdimjplusdimxdim2] * img[tdimjplusdimxdim2];
            int temp2 = w[tdimjplusdimxdim3] * img[tdimjplusdimxdim3];
            dst[tdimj] += temp1 + temp2;
        }
        t_dim += dim;
    }
}

char fusion_descr_enes_4[] = "fusion: ENES4 version";
void fusion_enes_4(int dim, int *img, int *w, int *dst)
{
    int i, j, x;
    int dimxdim = dim * dim;
    int dimxdim2 = dimxdim + dimxdim;
    int dimxdim3 = dimxdim2 + dimxdim;
    int *w_temp = w;
    int *img_temp = img;
    int *w_temp2 = w + dimxdim;
    int *img_temp2 = img + dimxdim;
    int *dst_temp = dst;

    for (i = 0; i < dim; i += 32)
    {
        int x_edge = i + 32;
        for (j = 0; j < dim; j += 32)
        {
            for (x = i; x < x_edge; x++)
            {

                dst_temp[0] += w_temp[0] * img_temp[0] + w_temp2[0] * img_temp2[0];
                dst_temp[1] += w_temp[1] * img_temp[1] + w_temp2[1] * img_temp2[1];
                dst_temp[2] += w_temp[2] * img_temp[2] + w_temp2[2] * img_temp2[2];
                dst_temp[3] += w_temp[3] * img_temp[3] + w_temp2[3] * img_temp2[3];
                dst_temp[4] += w_temp[4] * img_temp[4] + w_temp2[4] * img_temp2[4];
                dst_temp[5] += w_temp[5] * img_temp[5] + w_temp2[5] * img_temp2[5];
                dst_temp[6] += w_temp[6] * img_temp[6] + w_temp2[6] * img_temp2[6];
                dst_temp[7] += w_temp[7] * img_temp[7] + w_temp2[7] * img_temp2[7];
                dst_temp[8] += w_temp[8] * img_temp[8] + w_temp2[8] * img_temp2[8];
                dst_temp[9] += w_temp[9] * img_temp[9] + w_temp2[9] * img_temp2[9];
                dst_temp[10] += w_temp[10] * img_temp[10] + w_temp2[10] * img_temp2[10];
                dst_temp[11] += w_temp[11] * img_temp[11] + w_temp2[11] * img_temp2[11];
                dst_temp[12] += w_temp[12] * img_temp[12] + w_temp2[12] * img_temp2[12];
                dst_temp[13] += w_temp[13] * img_temp[13] + w_temp2[13] * img_temp2[13];
                dst_temp[14] += w_temp[14] * img_temp[14] + w_temp2[14] * img_temp2[14];
                dst_temp[15] += w_temp[15] * img_temp[15] + w_temp2[15] * img_temp2[15];
                dst_temp[16] += w_temp[16] * img_temp[16] + w_temp2[16] * img_temp2[16];
                dst_temp[17] += w_temp[17] * img_temp[17] + w_temp2[17] * img_temp2[17];
                dst_temp[18] += w_temp[18] * img_temp[18] + w_temp2[18] * img_temp2[18];
                dst_temp[19] += w_temp[19] * img_temp[19] + w_temp2[19] * img_temp2[19];
                dst_temp[20] += w_temp[20] * img_temp[20] + w_temp2[20] * img_temp2[20];
                dst_temp[21] += w_temp[21] * img_temp[21] + w_temp2[21] * img_temp2[21];
                dst_temp[22] += w_temp[22] * img_temp[22] + w_temp2[22] * img_temp2[22];
                dst_temp[23] += w_temp[23] * img_temp[23] + w_temp2[23] * img_temp2[23];
                dst_temp[24] += w_temp[24] * img_temp[24] + w_temp2[24] * img_temp2[24];
                dst_temp[25] += w_temp[25] * img_temp[25] + w_temp2[25] * img_temp2[25];
                dst_temp[26] += w_temp[26] * img_temp[26] + w_temp2[26] * img_temp2[26];
                dst_temp[27] += w_temp[27] * img_temp[27] + w_temp2[27] * img_temp2[27];
                dst_temp[28] += w_temp[28] * img_temp[28] + w_temp2[28] * img_temp2[28];
                dst_temp[29] += w_temp[29] * img_temp[29] + w_temp2[29] * img_temp2[29];
                dst_temp[30] += w_temp[30] * img_temp[30] + w_temp2[30] * img_temp2[30];
                dst_temp[31] += w_temp[31] * img_temp[31] + w_temp2[31] * img_temp2[31];
                w_temp += 32;
                img_temp += 32;
                w_temp2 += 32;
                img_temp2 += 32;
                dst_temp += 32;
            }
        }
    }

    w_temp = w + dimxdim2;
    img_temp = img + dimxdim2;
    w_temp2 = w + dimxdim3;
    img_temp2 = img + dimxdim3;
    for (i = 0; i < dim; i += 32)
    {
        for (j = 0; j < dim; j += 32)
        {
            int x_edge = i + 32;
            for (x = i; x < x_edge; x++)
            {

                dst[0] += w_temp[0] * img_temp[0] + w_temp2[0] * img_temp2[0];
                dst[1] += w_temp[1] * img_temp[1] + w_temp2[1] * img_temp2[1];
                dst[2] += w_temp[2] * img_temp[2] + w_temp2[2] * img_temp2[2];
                dst[3] += w_temp[3] * img_temp[3] + w_temp2[3] * img_temp2[3];
                dst[4] += w_temp[4] * img_temp[4] + w_temp2[4] * img_temp2[4];
                dst[5] += w_temp[5] * img_temp[5] + w_temp2[5] * img_temp2[5];
                dst[6] += w_temp[6] * img_temp[6] + w_temp2[6] * img_temp2[6];
                dst[7] += w_temp[7] * img_temp[7] + w_temp2[7] * img_temp2[7];
                dst[8] += w_temp[8] * img_temp[8] + w_temp2[8] * img_temp2[8];
                dst[9] += w_temp[9] * img_temp[9] + w_temp2[9] * img_temp2[9];
                dst[10] += w_temp[10] * img_temp[10] + w_temp2[10] * img_temp2[10];
                dst[11] += w_temp[11] * img_temp[11] + w_temp2[11] * img_temp2[11];
                dst[12] += w_temp[12] * img_temp[12] + w_temp2[12] * img_temp2[12];
                dst[13] += w_temp[13] * img_temp[13] + w_temp2[13] * img_temp2[13];
                dst[14] += w_temp[14] * img_temp[14] + w_temp2[14] * img_temp2[14];
                dst[15] += w_temp[15] * img_temp[15] + w_temp2[15] * img_temp2[15];
                dst[16] += w_temp[16] * img_temp[16] + w_temp2[16] * img_temp2[16];
                dst[17] += w_temp[17] * img_temp[17] + w_temp2[17] * img_temp2[17];
                dst[18] += w_temp[18] * img_temp[18] + w_temp2[18] * img_temp2[18];
                dst[19] += w_temp[19] * img_temp[19] + w_temp2[19] * img_temp2[19];
                dst[20] += w_temp[20] * img_temp[20] + w_temp2[20] * img_temp2[20];
                dst[21] += w_temp[21] * img_temp[21] + w_temp2[21] * img_temp2[21];
                dst[22] += w_temp[22] * img_temp[22] + w_temp2[22] * img_temp2[22];
                dst[23] += w_temp[23] * img_temp[23] + w_temp2[23] * img_temp2[23];
                dst[24] += w_temp[24] * img_temp[24] + w_temp2[24] * img_temp2[24];
                dst[25] += w_temp[25] * img_temp[25] + w_temp2[25] * img_temp2[25];
                dst[26] += w_temp[26] * img_temp[26] + w_temp2[26] * img_temp2[26];
                dst[27] += w_temp[27] * img_temp[27] + w_temp2[27] * img_temp2[27];
                dst[28] += w_temp[28] * img_temp[28] + w_temp2[28] * img_temp2[28];
                dst[29] += w_temp[29] * img_temp[29] + w_temp2[29] * img_temp2[29];
                dst[30] += w_temp[30] * img_temp[30] + w_temp2[30] * img_temp2[30];
                dst[31] += w_temp[31] * img_temp[31] + w_temp2[31] * img_temp2[31];
                w_temp += 32;
                img_temp += 32;
                w_temp2 += 32;
                img_temp2 += 32;
                dst += 32;
            }
        }
    }
}

char fusion_descr_enes_5[] = "fusion: ENES5 version";
void fusion_enes_5(int dim, int *img, int *w, int *dst)
{
    int i, j, x, y;
    int dimxdim = dim * dim;
    int dimxdim2 = dimxdim + dimxdim;
    int dimxdim3 = dimxdim2 + dimxdim;
    int t_dim = 0;
    for (i = 0; i < dim; i += 32)
    {

        int tdimjplusdimxdim = t_dim + dimxdim;
        for (j = 0; j < dim; j += 32)
        {
            int x_edge = i + 32;
            for (x = i; x < x_edge; x++)
            {
                int y_edge = j + 32;
                for (y = j; y < y_edge; y++)
                {
                    int temp1 = w[t_dim] * img[t_dim];
                    int temp2 = w[tdimjplusdimxdim] * img[tdimjplusdimxdim];
                    dst[t_dim] += temp1 + temp2;
                    t_dim++;
                    tdimjplusdimxdim++;
                }
            }
        }
    }

    t_dim = 0;
    for (i = 0; i < dim; i += 32)
    {
        for (j = 0; j < dim; j += 32)
        {
            int x_edge = i + 32;
            for (x = i; x < x_edge; x++)
            {
                int y_edge = j + 32;
                for (y = j; y < y_edge; y++)
                {
                    int tdimjplusdimxdim2 = t_dim + dimxdim2;
                    int tdimjplusdimxdim3 = t_dim + dimxdim3;
                    int temp1 = w[tdimjplusdimxdim2] * img[tdimjplusdimxdim2];
                    int temp2 = w[tdimjplusdimxdim3] * img[tdimjplusdimxdim3];
                    dst[t_dim] += temp1 + temp2;
                    t_dim++;
                }
            }
        }
    }
}

/*********************************************************************
 * register_fusion_functions - Register all of your different versions
 *     of the fusion kernel with the driver by calling the
 *     add_fusion_function() for each test function. When you run the
 *     driver program, it will test and report the performance of each
 *     registered test function.
 *********************************************************************/

void register_fusion_functions()
{
    add_fusion_function(&naive_fusion, naive_fusion_descr);
    add_fusion_function(&fusion, fusion_descr);
    // add_fusion_function(&fusion_enes, fusion_descr_enes);
    // add_fusion_function(&fusion_enes_2, fusion_descr_enes_2);
    // add_fusion_function(&fusion_enes_4, fusion_descr_enes_4);
    // add_fusion_function(&fusion_enes_5, fusion_descr_enes_5);
    /* ... Register additional test functions here */
}

/***************************
 * GAUSSIAN BLUR KERNEL *
 ***************************/

/******************************************************
 * Your different versions of the Gaussian blur functions go here
 ******************************************************/

/*
 * naive_blur - The naive baseline version of Gussian blur
 */
char naive_blur_descr[] = "naive_blur The naive baseline version of Gaussian blur";
void naive_blur(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    for (i = 0; i < dim - 5 + 1; i++)
    {
        for (j = 0; j < dim - 5 + 1; j++)
        {
            for (k = 0; k < 5; k++)
            {
                for (l = 0; l < 5; l++)
                {
                    dst[i * dim + j] = dst[i * dim + j] + img[(i + k) * dim + j + l] * flt[k * dim + l];
                }
            }
        }
    }
}

/*
 * blur - Your current working version of Gaussian blur
 * IMPORTANT: This is the version you will be graded on
 */
char blur_descr[] = "blur: Current working version";
void blur(int dim, float *img, float *flt, float *dst)
{
    int i, j, idimj;
    float flt00 = flt[0];
    float flt10 = flt[dim];
    float flt20 = flt[dim + dim];
    float flt30 = flt[dim + dim + dim];
    float flt40 = flt[dim + dim + dim + dim];
    float ar1 = flt[1] / flt00;
    float ar2 = flt[2] / flt00;
    int rows = dim - 4;

    int idim = 0;
    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < dim; j += 8)
        {
            idimj = idim + j;
            dst[idimj] += flt00 * img[idimj] + flt10 * img[idimj + dim] + flt20 * img[idimj + (dim + dim)] + flt30 * img[idimj + 3 * dim] + flt40 * img[idimj + 4 * dim];
            dst[idimj + 1] += flt00 * img[idimj + 1] + flt10 * img[idimj + dim + 1] + flt20 * img[idimj + (dim + dim) + 1] + flt30 * img[idimj + 3 * dim + 1] + flt40 * img[idimj + 4 * dim + 1];
            dst[idimj + 2] += flt00 * img[idimj + 2] + flt10 * img[idimj + dim + 2] + flt20 * img[idimj + (dim + dim) + 2] + flt30 * img[idimj + 3 * dim + 2] + flt40 * img[idimj + 4 * dim + 2];
            dst[idimj + 3] += flt00 * img[idimj + 3] + flt10 * img[idimj + dim + 3] + flt20 * img[idimj + (dim + dim) + 3] + flt30 * img[idimj + 3 * dim + 3] + flt40 * img[idimj + 4 * dim + 3];
            dst[idimj + 4] += flt00 * img[idimj + 4] + flt10 * img[idimj + dim + 4] + flt20 * img[idimj + (dim + dim) + 4] + flt30 * img[idimj + 3 * dim + 4] + flt40 * img[idimj + 4 * dim + 4];
            dst[idimj + 5] += flt00 * img[idimj + 5] + flt10 * img[idimj + dim + 5] + flt20 * img[idimj + (dim + dim) + 5] + flt30 * img[idimj + 3 * dim + 5] + flt40 * img[idimj + 4 * dim + 5];
            dst[idimj + 6] += flt00 * img[idimj + 6] + flt10 * img[idimj + dim + 6] + flt20 * img[idimj + (dim + dim) + 6] + flt30 * img[idimj + 3 * dim + 6] + flt40 * img[idimj + 4 * dim + 6];
            dst[idimj + 7] += flt00 * img[idimj + 7] + flt10 * img[idimj + dim + 7] + flt20 * img[idimj + (dim + dim) + 7] + flt30 * img[idimj + 3 * dim + 7] + flt40 * img[idimj + 4 * dim + 7];
        }
        idim += dim;
    }

    idim = 0;
    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < rows; j++)
        {
            int idimj = idim + j;
            dst[idimj] = dst[idimj] + ar1 * dst[idimj + 1] + ar2 * dst[idimj + 2] + ar1 * dst[idimj + 3] + dst[idimj + 4];
        }
        idim += dim;
    }
}

char blurrr_descr[] = "separate filter matrix";
void blurrr(int dim, float *img, float *flt, float *dst)
{
    int i, j;
    float flt00 = flt[0];
    float flt10 = flt[dim];
    float flt20 = flt[dim + dim];
    float flt30 = flt[dim + dim + dim];
    float flt40 = flt[dim + dim + dim + dim];
    float ar1 = flt[1] / flt00;
    float ar2 = flt[2] / flt00;
    int rows = dim - 4;
    float *temp = (float *)calloc(dim * dim, sizeof(float));
    // float temp[dim*dim];
    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < dim; j++)
        {
            temp[i * dim + j] += flt00 * img[i * dim + j] + flt10 * img[(i + 1) * dim + j] + flt20 * img[(i + 2) * dim + j] + flt30 * img[(i + 3) * dim + j] + flt40 * img[(i + 4) * dim + j];
        }
    }
    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < rows; j++)
        {
            dst[i * dim + j] = temp[i * dim + j] + ar1 * temp[i * dim + j + 1] + ar2 * temp[i * dim + j + 2] + ar1 * temp[i * dim + j + 3] + temp[i * dim + j + 4];
        }
    }
    dst[(dim - 1) * (dim - 1)] = -1;
    free(temp);
}

char blurrr2_descr[] = "no need for temp";
void blurrr2(int dim, float *img, float *flt, float *dst)
{
    int i, j;
    float flt00 = flt[0];
    float flt10 = flt[dim];
    float flt20 = flt[dim + dim];
    float flt30 = flt[dim + dim + dim];
    float flt40 = flt[dim + dim + dim + dim];
    float ar1 = flt[1] / flt00;
    float ar2 = flt[2] / flt00;
    int rows = dim - 4;

    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < dim; j++)
        {
            dst[i * dim + j] += flt00 * img[i * dim + j] + flt10 * img[(i + 1) * dim + j] + flt20 * img[(i + 2) * dim + j] + flt30 * img[(i + 3) * dim + j] + flt40 * img[(i + 4) * dim + j];
        }
    }
    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < rows; j++)
        {
            dst[i * dim + j] = dst[i * dim + j] + ar1 * dst[i * dim + j + 1] + ar2 * dst[i * dim + j + 2] + ar1 * dst[i * dim + j + 3] + dst[i * dim + j + 4];
        }
    }
}

char blurrr3_descr[] = "add idimj to second loop";
void blurrr3(int dim, float *img, float *flt, float *dst)
{
    int i, j;
    float flt00 = flt[0];
    float flt10 = flt[dim];
    float flt20 = flt[dim + dim];
    float flt30 = flt[dim + dim + dim];
    float flt40 = flt[dim + dim + dim + dim];
    float ar1 = flt[1] / flt00;
    float ar2 = flt[2] / flt00;
    int rows = dim - 4;

    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < dim; j++)
        {
            // int idimj = i * dim + j;
            dst[i * dim + j] += flt00 * img[i * dim + j] + flt10 * img[(i + 1) * dim + j] + flt20 * img[(i + 2) * dim + j] + flt30 * img[(i + 3) * dim + j] + flt40 * img[(i + 4) * dim + j];
        }
    }
    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < rows; j++)
        {
            int idimj = i * dim + j;
            dst[idimj] = dst[idimj] + ar1 * dst[idimj + 1] + ar2 * dst[idimj + 2] + ar1 * dst[idimj + 3] + dst[idimj + 4];
        }
    }
}

char blurrr4_descr[] = "blurrr v4 - 8-unroll";
void blurrr4(int dim, float *img, float *flt, float *dst)
{
    int i, j, idimj;
    float flt00 = flt[0];
    float flt10 = flt[dim];
    float flt20 = flt[dim + dim];
    float flt30 = flt[dim + dim + dim];
    float flt40 = flt[dim + dim + dim + dim];
    float ar1 = flt[1] / flt00;
    float ar2 = flt[2] / flt00;
    int rows = dim - 4;

    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < dim; j += 8)
        {
            idimj = i * dim + j;
            dst[idimj] += flt00 * img[idimj] + flt10 * img[(i + 1) * dim + j] + flt20 * img[(i + 2) * dim + j] + flt30 * img[(i + 3) * dim + j] + flt40 * img[(i + 4) * dim + j];
            dst[idimj + 1] += flt00 * img[idimj + 1] + flt10 * img[(i + 1) * dim + j + 1] + flt20 * img[(i + 2) * dim + j + 1] + flt30 * img[(i + 3) * dim + j + 1] + flt40 * img[(i + 4) * dim + j + 1];
            dst[idimj + 2] += flt00 * img[idimj + 2] + flt10 * img[(i + 1) * dim + j + 2] + flt20 * img[(i + 2) * dim + j + 2] + flt30 * img[(i + 3) * dim + j + 2] + flt40 * img[(i + 4) * dim + j + 2];
            dst[idimj + 3] += flt00 * img[idimj + 3] + flt10 * img[(i + 1) * dim + j + 3] + flt20 * img[(i + 2) * dim + j + 3] + flt30 * img[(i + 3) * dim + j + 3] + flt40 * img[(i + 4) * dim + j + 3];
            dst[idimj + 4] += flt00 * img[idimj + 4] + flt10 * img[(i + 1) * dim + j + 4] + flt20 * img[(i + 2) * dim + j + 4] + flt30 * img[(i + 3) * dim + j + 4] + flt40 * img[(i + 4) * dim + j + 4];
            dst[idimj + 5] += flt00 * img[idimj + 5] + flt10 * img[(i + 1) * dim + j + 5] + flt20 * img[(i + 2) * dim + j + 5] + flt30 * img[(i + 3) * dim + j + 5] + flt40 * img[(i + 4) * dim + j + 5];
            dst[idimj + 6] += flt00 * img[idimj + 6] + flt10 * img[(i + 1) * dim + j + 6] + flt20 * img[(i + 2) * dim + j + 6] + flt30 * img[(i + 3) * dim + j + 6] + flt40 * img[(i + 4) * dim + j + 6];
            dst[idimj + 7] += flt00 * img[idimj + 7] + flt10 * img[(i + 1) * dim + j + 7] + flt20 * img[(i + 2) * dim + j + 7] + flt30 * img[(i + 3) * dim + j + 7] + flt40 * img[(i + 4) * dim + j + 7];
        }
    }
    for (i = 0; i < rows; i++)
    {
        for (j = 0; j < rows; j++)
        {
            int idimj = i * dim + j;
            dst[idimj] = dst[idimj] + ar1 * dst[idimj + 1] + ar2 * dst[idimj + 2] + ar1 * dst[idimj + 3] + dst[idimj + 4];
        }
    }
}

char blur_descr_old[] = "blur: OLD version";
void blur_old(int dim, float *img, float *flt, float *dst)
{
    int i, j;
    int dimminus4 = dim - 4;
    float *cacheArr = (float *)malloc(sizeof(float) * 25);
    float *t_flt0 = flt;
    float *t_flt1 = flt + dim;
    float *t_flt2 = flt + 2 * dim;
    float *t_flt3 = flt + 3 * dim;
    float *t_flt4 = flt + 4 * dim;

    for (int x = 0; x < 5; x++)
    {
        cacheArr[x] = t_flt0[x];
        cacheArr[x + 5] = t_flt1[x];
        cacheArr[x + 10] = t_flt2[x];
        cacheArr[x + 15] = t_flt3[x];
        cacheArr[x + 20] = t_flt4[x];
    }

    int dimx2 = dim * 2;
    int dimx3 = dim * 3;
    int dimx4 = dim * 4;
    for (i = 0; i < dimminus4; i++)
    {
        int idim = i * dim;
        for (j = 0; j < dimminus4; j += 8)
        {
            int idimj = idim + j;
            float *t_img_main = img + idimj;
            float *t_img0 = t_img_main;
            float *t_img1 = t_img_main + dim;
            float *t_img2 = t_img_main + dimx2;
            float *t_img3 = t_img_main + dimx3;
            float *t_img4 = t_img_main + dimx4;

            float temp1 = (t_img0[0] * cacheArr[0]) + (t_img0[1] * cacheArr[1]) + (t_img0[2] * cacheArr[2]) + (t_img0[3] * cacheArr[3]) + (t_img0[4] * cacheArr[4]);
            float temp2 = (t_img1[0] * cacheArr[5]) + (t_img1[1] * cacheArr[6]) + (t_img1[2] * cacheArr[7]) + (t_img1[3] * cacheArr[8]) + (t_img1[4] * cacheArr[9]);
            float temp3 = (t_img2[0] * cacheArr[10]) + (t_img2[1] * cacheArr[11]) + (t_img2[2] * cacheArr[12]) + (t_img2[3] * cacheArr[13]) + (t_img2[4] * cacheArr[14]);
            float temp4 = (t_img3[0] * cacheArr[15]) + (t_img3[1] * cacheArr[16]) + (t_img3[2] * cacheArr[17]) + (t_img3[3] * cacheArr[18]) + (t_img3[4] * cacheArr[19]);
            float temp5 = (t_img4[0] * cacheArr[20]) + (t_img4[1] * cacheArr[21]) + (t_img4[2] * cacheArr[22]) + (t_img4[3] * cacheArr[23]) + (t_img4[4] * cacheArr[24]);

            dst[idimj] += temp1 + temp2 + temp3 + temp4 + temp5;

            temp1 = (t_img0[1] * cacheArr[0]) + (t_img0[2] * cacheArr[1]) + (t_img0[3] * cacheArr[2]) + (t_img0[4] * cacheArr[3]) + (t_img0[5] * cacheArr[4]);
            temp2 = (t_img1[1] * cacheArr[5]) + (t_img1[2] * cacheArr[6]) + (t_img1[3] * cacheArr[7]) + (t_img1[4] * cacheArr[8]) + (t_img1[5] * cacheArr[9]);
            temp3 = (t_img2[1] * cacheArr[10]) + (t_img2[2] * cacheArr[11]) + (t_img2[3] * cacheArr[12]) + (t_img2[4] * cacheArr[13]) + (t_img2[5] * cacheArr[14]);
            temp4 = (t_img3[1] * cacheArr[15]) + (t_img3[2] * cacheArr[16]) + (t_img3[3] * cacheArr[17]) + (t_img3[4] * cacheArr[18]) + (t_img3[5] * cacheArr[19]);
            temp5 = (t_img4[1] * cacheArr[20]) + (t_img4[2] * cacheArr[21]) + (t_img4[3] * cacheArr[22]) + (t_img4[4] * cacheArr[23]) + (t_img4[5] * cacheArr[24]);

            dst[idimj + 1] += temp1 + temp2 + temp3 + temp4 + temp5;

            temp1 = (t_img0[2] * cacheArr[0]) + (t_img0[3] * cacheArr[1]) + (t_img0[4] * cacheArr[2]) + (t_img0[5] * cacheArr[3]) + (t_img0[6] * cacheArr[4]);
            temp2 = (t_img1[2] * cacheArr[5]) + (t_img1[3] * cacheArr[6]) + (t_img1[4] * cacheArr[7]) + (t_img1[5] * cacheArr[8]) + (t_img1[6] * cacheArr[9]);
            temp3 = (t_img2[2] * cacheArr[10]) + (t_img2[3] * cacheArr[11]) + (t_img2[4] * cacheArr[12]) + (t_img2[5] * cacheArr[13]) + (t_img2[6] * cacheArr[14]);
            temp4 = (t_img3[2] * cacheArr[15]) + (t_img3[3] * cacheArr[16]) + (t_img3[4] * cacheArr[17]) + (t_img3[5] * cacheArr[18]) + (t_img3[6] * cacheArr[19]);
            temp5 = (t_img4[2] * cacheArr[20]) + (t_img4[3] * cacheArr[21]) + (t_img4[4] * cacheArr[22]) + (t_img4[5] * cacheArr[23]) + (t_img4[6] * cacheArr[24]);

            dst[idimj + 2] += temp1 + temp2 + temp3 + temp4 + temp5;

            temp1 = (t_img0[3] * cacheArr[0]) + (t_img0[4] * cacheArr[1]) + (t_img0[5] * cacheArr[2]) + (t_img0[6] * cacheArr[3]) + (t_img0[7] * cacheArr[4]);
            temp2 = (t_img1[3] * cacheArr[5]) + (t_img1[4] * cacheArr[6]) + (t_img1[5] * cacheArr[7]) + (t_img1[6] * cacheArr[8]) + (t_img1[7] * cacheArr[9]);
            temp3 = (t_img2[3] * cacheArr[10]) + (t_img2[4] * cacheArr[11]) + (t_img2[5] * cacheArr[12]) + (t_img2[6] * cacheArr[13]) + (t_img2[7] * cacheArr[14]);
            temp4 = (t_img3[3] * cacheArr[15]) + (t_img3[4] * cacheArr[16]) + (t_img3[5] * cacheArr[17]) + (t_img3[6] * cacheArr[18]) + (t_img3[7] * cacheArr[19]);
            temp5 = (t_img4[3] * cacheArr[20]) + (t_img4[4] * cacheArr[21]) + (t_img4[5] * cacheArr[22]) + (t_img4[6] * cacheArr[23]) + (t_img4[7] * cacheArr[24]);

            dst[idimj + 3] += temp1 + temp2 + temp3 + temp4 + temp5;

            if (j + 8 > dimminus4)
            {
                break;
            }

            temp1 = (t_img0[4] * cacheArr[0]) + (t_img0[5] * cacheArr[1]) + (t_img0[6] * cacheArr[2]) + (t_img0[7] * cacheArr[3]) + (t_img0[8] * cacheArr[4]);
            temp2 = (t_img1[4] * cacheArr[5]) + (t_img1[5] * cacheArr[6]) + (t_img1[6] * cacheArr[7]) + (t_img1[7] * cacheArr[8]) + (t_img1[8] * cacheArr[9]);
            temp3 = (t_img2[4] * cacheArr[10]) + (t_img2[5] * cacheArr[11]) + (t_img2[6] * cacheArr[12]) + (t_img2[7] * cacheArr[13]) + (t_img2[8] * cacheArr[14]);
            temp4 = (t_img3[4] * cacheArr[15]) + (t_img3[5] * cacheArr[16]) + (t_img3[6] * cacheArr[17]) + (t_img3[7] * cacheArr[18]) + (t_img3[8] * cacheArr[19]);
            temp5 = (t_img4[4] * cacheArr[20]) + (t_img4[5] * cacheArr[21]) + (t_img4[6] * cacheArr[22]) + (t_img4[7] * cacheArr[23]) + (t_img4[8] * cacheArr[24]);

            dst[idimj + 4] += temp1 + temp2 + temp3 + temp4 + temp5;

            temp1 = (t_img0[5] * cacheArr[0]) + (t_img0[6] * cacheArr[1]) + (t_img0[7] * cacheArr[2]) + (t_img0[8] * cacheArr[3]) + (t_img0[9] * cacheArr[4]);
            temp2 = (t_img1[5] * cacheArr[5]) + (t_img1[6] * cacheArr[6]) + (t_img1[7] * cacheArr[7]) + (t_img1[8] * cacheArr[8]) + (t_img1[9] * cacheArr[9]);
            temp3 = (t_img2[5] * cacheArr[10]) + (t_img2[6] * cacheArr[11]) + (t_img2[7] * cacheArr[12]) + (t_img2[8] * cacheArr[13]) + (t_img2[9] * cacheArr[14]);
            temp4 = (t_img3[5] * cacheArr[15]) + (t_img3[6] * cacheArr[16]) + (t_img3[7] * cacheArr[17]) + (t_img3[8] * cacheArr[18]) + (t_img3[9] * cacheArr[19]);
            temp5 = (t_img4[5] * cacheArr[20]) + (t_img4[6] * cacheArr[21]) + (t_img4[7] * cacheArr[22]) + (t_img4[8] * cacheArr[23]) + (t_img4[9] * cacheArr[24]);

            dst[idimj + 5] += temp1 + temp2 + temp3 + temp4 + temp5;

            temp1 = (t_img0[6] * cacheArr[0]) + (t_img0[7] * cacheArr[1]) + (t_img0[8] * cacheArr[2]) + (t_img0[9] * cacheArr[3]) + (t_img0[10] * cacheArr[4]);
            temp2 = (t_img1[6] * cacheArr[5]) + (t_img1[7] * cacheArr[6]) + (t_img1[8] * cacheArr[7]) + (t_img1[9] * cacheArr[8]) + (t_img1[10] * cacheArr[9]);
            temp3 = (t_img2[6] * cacheArr[10]) + (t_img2[7] * cacheArr[11]) + (t_img2[8] * cacheArr[12]) + (t_img2[9] * cacheArr[13]) + (t_img2[10] * cacheArr[14]);
            temp4 = (t_img3[6] * cacheArr[15]) + (t_img3[7] * cacheArr[16]) + (t_img3[8] * cacheArr[17]) + (t_img3[9] * cacheArr[18]) + (t_img3[10] * cacheArr[19]);
            temp5 = (t_img4[6] * cacheArr[20]) + (t_img4[7] * cacheArr[21]) + (t_img4[8] * cacheArr[22]) + (t_img4[9] * cacheArr[23]) + (t_img4[10] * cacheArr[24]);

            dst[idimj + 6] += temp1 + temp2 + temp3 + temp4 + temp5;

            temp1 = (t_img0[7] * cacheArr[0]) + (t_img0[8] * cacheArr[1]) + (t_img0[9] * cacheArr[2]) + (t_img0[10] * cacheArr[3]) + (t_img0[11] * cacheArr[4]);
            temp2 = (t_img1[7] * cacheArr[5]) + (t_img1[8] * cacheArr[6]) + (t_img1[9] * cacheArr[7]) + (t_img1[10] * cacheArr[8]) + (t_img1[11] * cacheArr[9]);
            temp3 = (t_img2[7] * cacheArr[10]) + (t_img2[8] * cacheArr[11]) + (t_img2[9] * cacheArr[12]) + (t_img2[10] * cacheArr[13]) + (t_img2[11] * cacheArr[14]);
            temp4 = (t_img3[7] * cacheArr[15]) + (t_img3[8] * cacheArr[16]) + (t_img3[9] * cacheArr[17]) + (t_img3[10] * cacheArr[18]) + (t_img3[11] * cacheArr[19]);
            temp5 = (t_img4[7] * cacheArr[20]) + (t_img4[8] * cacheArr[21]) + (t_img4[9] * cacheArr[22]) + (t_img4[10] * cacheArr[23]) + (t_img4[11] * cacheArr[24]);

            dst[idimj + 7] += temp1 + temp2 + temp3 + temp4 + temp5;
        }
    }
}


/*********************************************************************
 * register_blur_functions - Register all of your different versions
 *     of the gaussian blur kernel with the driver by calling the
 *     add_blur_function() for each test function. When you run the
 *     driver program, it will test and report the performance of each
 *     registered test function.
 *********************************************************************/

void register_blur_functions()
{
    add_blur_function(&naive_blur, naive_blur_descr);
    add_blur_function(&blur, blur_descr);
    add_blur_function(&blur_old, blur_descr_old);
    // add_blur_function(&blurrr, blurrr_descr);
    // add_blur_function(&blurrr2, blurrr2_descr);
    // add_blur_function(&blurrr3, blurrr3_descr);
    // add_blur_function(&blurrr4, blurrr4_descr);
    /* ... Register additional test functions here */
}
