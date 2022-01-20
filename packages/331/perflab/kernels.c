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
    "Team", /* Team name */

    "Ahmet Buğrahan Budak",    /* First member full name */
    "e2380236", /* First member id */

    "Emre Berk Kaya", /* Second member full name (leave blank if none) */
    "e2380590",               /* Second member id (leave blank if none) */

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
    naive_fusion(dim, img, w, dst);
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

char fusion_descr_enes_3[] = "fusion: ENES3 version";
void fusion_enes_3(int dim, int *img, int *w, int *dst)
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
    add_fusion_function(&fusion_enes_3, fusion_descr_enes_3);
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
    naive_blur(dim, img, flt, dst);
}

char blur_descr_ijlk[] = "blur: IKJL version";
void blur_ijlk(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    int dimminus4 = dim - 4;

    for (i = 0; i < dimminus4; i++)
    {
        for (j = 0; j < dimminus4; j++)
        {
            for (l = 0; l < 5; l++)
            {
                for (k = 0; k < 5; k++)
                {
                    dst[i * dim + j] = dst[i * dim + j] + img[(i + k) * dim + j + l] * flt[k * dim + l];
                }
            }
        }
    }
}

char blur_descr_ikjl[] = "blur: IKJL version";
void blur_ikjl(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    int dimminus4 = dim - 4;

    for (i = 0; i < dimminus4; i++)
    {
        for (k = 0; k < 5; k++)
        {
            for (j = 0; j < dimminus4; j++)
            {
                for (l = 0; l < 5; l++)
                {
                    dst[i * dim + j] = dst[i * dim + j] + img[(i + k) * dim + j + l] * flt[k * dim + l];
                }
            }
        }
    }
}

char blur_descr_iklj[] = "blur: IKLJ_edited version";
void blur_iklj(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    int dimminus4 = dim - 4;

    for (i = 0; i < dimminus4; i++)
    {
        int idim = i * dim;
        for (k = 0; k < 5; k++)
        {
            int kdim = k * dim;
            for (l = 0; l < 5; l++)
            {
                int kdiml = kdim + l;
                int idimj = idim;
                for (j = 0; j < dimminus4; j++)
                {
                    dst[idimj] = dst[idimj] + img[kdiml + idimj] * flt[kdiml];
                    idimj++;
                }
            }
        }
    }
}
char blur_descr_iljk[] = "blur: ILJK version";
void blur_iljk(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    int dimminus4 = dim - 4;

    for (i = 0; i < dimminus4; i++)
    {
        int idim = i * dim;
        for (l = 0; l < 5; l++)
        {
            for (j = 0; j < dimminus4; j++)
            {
                int idimj = idim + j;
                for (k = 0; k < 5; k++)
                {
                    dst[idimj] = dst[idimj] + img[k * dim + idimj + l] * flt[k * dim + l];
                }
            }
        }
    }
}

char blur_descr_ilkj[] = "blur: ILKJ version";
void blur_ilkj(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    int dimminus4 = dim - 4;

    for (i = 0; i < dimminus4; i++)
    {
        for (l = 0; l < 5; l++)
        {
            for (k = 0; k < 5; k++)
            {
                for (j = 0; j < dimminus4; j++)
                {
                    dst[i * dim + j] = dst[i * dim + j] + img[(i + k) * dim + j + l] * flt[k * dim + l];
                }
            }
        }
    }
}

char blur_descr_enes[] = "blur: ENES version";
void blur_enes(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    int dimminus4 = dim - 4;

    for (i = 0; i < dimminus4; i++)
    {
        int idim = i * dim;
        for (j = 0; j < dimminus4; j++)
        {
            int idimj = idim + j;
            int kdim0 = 0;
            int kdim1 = dim;
            int kdim2 = 2 * dim;
            int kdim3 = 3 * dim;
            int kdim4 = 4 * dim;
            float *t_img_main = img + idimj;
            float *t_img0 = t_img_main + kdim0;
            float *t_img1 = t_img_main + kdim1;
            float *t_img2 = t_img_main + kdim2;
            float *t_img3 = t_img_main + kdim3;
            float *t_img4 = t_img_main + kdim4;
            float *t_flt0 = flt + kdim0;
            float *t_flt1 = flt + kdim1;
            float *t_flt2 = flt + kdim2;
            float *t_flt3 = flt + kdim3;
            float *t_flt4 = flt + kdim4;

            float temp1 = t_img0[0] * t_flt0[0];
            float temp2 = t_img0[1] * t_flt0[1];
            float temp3 = t_img0[2] * t_flt0[2];
            float temp4 = t_img0[3] * t_flt0[3];
            float temp5 = t_img0[4] * t_flt0[4];

            temp1 += t_img1[0] * t_flt1[0];
            temp2 += t_img1[1] * t_flt1[1];
            temp3 += t_img1[2] * t_flt1[2];
            temp4 += t_img1[3] * t_flt1[3];
            temp5 += t_img1[4] * t_flt1[4];

            temp1 += t_img2[0] * t_flt2[0];
            temp2 += t_img2[1] * t_flt2[1];
            temp3 += t_img2[2] * t_flt2[2];
            temp4 += t_img2[3] * t_flt2[3];
            temp5 += t_img2[4] * t_flt2[4];

            temp1 += t_img3[0] * t_flt3[0];
            temp2 += t_img3[1] * t_flt3[1];
            temp3 += t_img3[2] * t_flt3[2];
            temp4 += t_img3[3] * t_flt3[3];
            temp5 += t_img3[4] * t_flt3[4];

            temp1 += t_img4[0] * t_flt4[0];
            temp2 += t_img4[1] * t_flt4[1];
            temp3 += t_img4[2] * t_flt4[2];
            temp4 += t_img4[3] * t_flt4[3];
            temp5 += t_img4[4] * t_flt4[4];

            dst[idimj] += temp1 + temp2 + temp3 + temp4 + temp5;
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

char blur_descr_jikl[] = "blur: jikl version";
void blur_jikl(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    for (j = 0; j < dim - 5 + 1; j++)
    {
        for (i = 0; i < dim - 5 + 1; i++)
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

char blur_descr_jilk[] = "blur: JILK version";
void blur_jilk(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    int dimminus4 = dim - 4;

    for (j = 0; j < dimminus4; j++)
    {
        for (i = 0; i < dimminus4; i++)
        {
            for (l = 0; l < 5; l++)
            {
                for (k = 0; k < 5; k++)
                {
                    dst[i * dim + j] = dst[i * dim + j] + img[(i + k) * dim + j + l] * flt[k * dim + l];
                }
            }
        }
    }
}

char blur_descr_jkil[] = "blur: jkil version";
void blur_jkil(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    int dimminus4 = dim - 4;

    for (j = 0; j < dimminus4; j++)
    {
        for (k = 0; k < 5; k++)
        {
            for (i = 0; i < dimminus4; i++)
            {
                for (l = 0; l < 5; l++)
                {
                    dst[i * dim + j] = dst[i * dim + j] + img[(i + k) * dim + j + l] * flt[k * dim + l];
                }
            }
        }
    }
}

char blur_descr_jkli[] = "blur: jkli version";
void blur_jkli(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    int dimminus4 = dim - 4;

    for (j = 0; j < dimminus4; j++)
    {
        for (k = 0; k < 5; k++)
        {
            for (l = 0; l < 5; l++)
            {
                for (i = 0; i < dimminus4; i++)
                {
                    dst[i * dim + j] = dst[i * dim + j] + img[(i + k) * dim + j + l] * flt[k * dim + l];
                }
            }
        }
    }
}
char blur_descr_jlik[] = "blur: jlik version";
void blur_jlik(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    int dimminus4 = dim - 4;

    for (j = 0; j < dimminus4; j++)
    {
        for (l = 0; l < 5; l++)
        {
            for (i = 0; i < dimminus4; i++)
            {
                for (k = 0; k < 5; k++)
                {
                    dst[i * dim + j] = dst[i * dim + j] + img[(i + k) * dim + j + l] * flt[k * dim + l];
                }
            }
        }
    }
}

char blur_descr_jlki[] = "blur: jlki version";
void blur_jlki(int dim, float *img, float *flt, float *dst)
{

    int i, j, k, l;

    int dimminus4 = dim - 4;

    for (j = 0; j < dimminus4; j++)
    {
        for (l = 0; l < 5; l++)
        {
            for (k = 0; k < 5; k++)
            {
                for (i = 0; i < dimminus4; i++)
                {
                    dst[i * dim + j] = dst[i * dim + j] + img[(i + k) * dim + j + l] * flt[k * dim + l];
                }
            }
        }
    }
}

void register_blur_functions()
{
    add_blur_function(&naive_blur, naive_blur_descr);
    add_blur_function(&blur, blur_descr);
    add_blur_function(&blur_ijlk, blur_descr_ijlk);
    add_blur_function(&blur_ikjl, blur_descr_ikjl);
    add_blur_function(&blur_iljk, blur_descr_iljk);
    add_blur_function(&blur_ilkj, blur_descr_ilkj);
    // add_blur_function(&blur_jikl, blur_descr_jikl);
    // add_blur_function(&blur_jilk, blur_descr_jilk);
    // add_blur_function(&blur_jkil, blur_descr_jkil);
    // add_blur_function(&blur_jkli, blur_descr_jkli);
    // add_blur_function(&blur_jlik, blur_descr_jlik);
    // add_blur_function(&blur_jlki, blur_descr_jlki);
    add_blur_function(&blur_iklj, blur_descr_iklj);
    add_blur_function(&blur_enes, blur_descr_enes);
    /* ... Register additional test functions here */
}
